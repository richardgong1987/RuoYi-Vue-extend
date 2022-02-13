package com.ruoyi.file.service;

import io.minio.Result;
import io.minio.messages.Item;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 文件上传接口
 *
 * @author ruoyi
 */
public interface ISysFileService {
    /**
     * 文件上传接口
     *
     * @param file 上传的文件
     * @return 访问地址
     * @throws Exception
     */
    public String uploadFile(MultipartFile file, String userId, String relativePath) throws Exception;

    public Object listFile(String userId, String relativePath) throws Exception;

    public String uploadFile(MultipartFile file) throws Exception;

    public String deleteFile(String url) throws Exception;
    public Object deleteFileList(String userId, String relativePath) throws Exception;
}
