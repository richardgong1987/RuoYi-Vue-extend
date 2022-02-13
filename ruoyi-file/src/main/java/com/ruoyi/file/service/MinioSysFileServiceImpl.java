package com.ruoyi.file.service;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.file.config.MinioConfig;
import io.minio.*;
import io.minio.errors.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

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
    public String uploadFile(MultipartFile file, String userId) throws Exception {
        var originalFilename = file.getOriginalFilename();
        var fileName = userId + "/" + originalFilename;
        return uploadAction(file, fileName);
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
