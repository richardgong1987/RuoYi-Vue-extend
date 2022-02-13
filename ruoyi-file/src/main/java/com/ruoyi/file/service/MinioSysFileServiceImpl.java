package com.ruoyi.file.service;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.file.config.MinioConfig;
import io.minio.*;
import io.minio.errors.*;
import io.minio.messages.DeleteObject;
import io.minio.messages.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

/**
 * Minio 文件存储
 *
 * @author ruoyi
 */
@Primary
@Service
public class MinioSysFileServiceImpl implements ISysFileService {
    @Autowired
    private MinioConfig minioConfig;

    @Autowired
    private MinioClient minioClient;


    private void createBucket(String bucketName) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        var found = minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
        if (!found) {
            minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
        }
    }

    /**
     * @param file   上传的文件
     * @param userId
     * @throws Exception
     */
    @Override
    public String uploadFile(MultipartFile file, String userId, String relativePath) throws Exception {
        var originalFilename = file.getOriginalFilename();
        var dir = Paths.get(relativePath).getParent().toString();
        var fileName = userId + "/" + dir + "/" + originalFilename;
        return uploadAction(file, fileName);
    }

    @Override
    public Object listFile(String userId, String relativePath) throws Exception {
        String bucketName = minioConfig.getBucketName();
        if (StringUtils.isEmpty(relativePath)) {
            relativePath = "/";
        }
        Iterable<Result<Item>> results = minioClient.listObjects(
            ListObjectsArgs.builder()
                .bucket(bucketName)
                .prefix(userId + relativePath)
                .build());
        var objects = new ArrayList<>();
        for (Result<Item> result : results) {
            Item item = result.get();
            HashMap<String, Object> stringObjectHashMap = new HashMap<>();
            stringObjectHashMap.put("objectName", item.objectName());
            stringObjectHashMap.put("isDir", item.isDir());
            objects.add(stringObjectHashMap);
        }
//        List<DeleteObject> deleteObjects = new LinkedList<>();
//        deleteObjects.add(new DeleteObject("my-objectname1"));
//        deleteObjects.add(new DeleteObject("my-objectname2"));
//        deleteObjects.add(new DeleteObject("my-objectname3"));
//
//        RemoveObjectsArgs build = RemoveObjectsArgs.builder().bucket(bucketName).objects(deleteObjects).build();

        {
            Iterable<Result<Item>> results2 = minioClient.listObjects(
                ListObjectsArgs.builder()
                    .bucket(bucketName)
                    .prefix(userId + relativePath).recursive(true)
                    .build());
            var objects2 = new ArrayList<>();
            for (Result<Item> result : results2) {
                Item item = result.get();
                HashMap<String, Object> stringObjectHashMap = new HashMap<>();
                stringObjectHashMap.put("objectName", item.objectName());
                stringObjectHashMap.put("isDir", item.isDir());
                objects2.add(stringObjectHashMap);
            }
        }
        return objects;
    }


    /**
     * @param file
     */
    @Override
    public String uploadFile(MultipartFile file) throws Exception {
        var originalFilename = file.getOriginalFilename();
        var fileName = DateUtils.datePath() + "/" + IdUtils.fastUUID() + "/" + originalFilename;
        return uploadAction(file, fileName);
    }

    @Override
    public Object deleteFileList(String userId, String relativePath) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        String bucketName = minioConfig.getBucketName();
        if (StringUtils.isEmpty(relativePath)) {
            relativePath = "/";
        }
        String prefix = userId + relativePath;
        Iterable<Result<Item>> results = minioClient.listObjects(
            ListObjectsArgs.builder()
                .bucket(bucketName)
                .prefix(prefix).recursive(true)
                .build());

        for (Result<Item> result : results) {
            Item item = result.get();
            deleteFileAction(item.objectName());
        }

        if (isFile(relativePath)) {
            deleteFileAction(prefix);
        }
        return null;
    }

    private void deleteFileAction(String objectName) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        minioClient.removeObject(
            RemoveObjectArgs.builder().bucket(minioConfig.getBucketName()).object(objectName).build());

    }

    private boolean isFile(String relativePath) {
        int i = relativePath.lastIndexOf(".");
        if (i > -1) {
            return relativePath.substring(i + 1).length() > 0;
        }
        return false;
    }

    @Override
    public String deleteFile(String url) throws Exception {
        String path = (new URL(url)).getPath();
        String bucketName = minioConfig.getBucketName();
        // Remove object.
        minioClient.removeObject(RemoveObjectArgs.builder().bucket(bucketName).object(path.substring(bucketName.length() + 1)).build());
        return "OK";
    }

    private String uploadAction(MultipartFile file, String fileName) throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
        var bucketName = minioConfig.getBucketName();
        this.createBucket(bucketName);
        PutObjectArgs args = PutObjectArgs.builder().bucket(bucketName).object(fileName).stream(file.getInputStream(), file.getSize(), -1).contentType(file.getContentType()).build();
        minioClient.putObject(args);
        return minioConfig.getUrl() + "/" + bucketName + "/" + fileName;
    }

}
