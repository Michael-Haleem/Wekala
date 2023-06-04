using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Hosting.Internal;
using System;
using System.IO;

namespace Wekala.Apis.Helpers
{
    public class DocumentSettings
    {
        public static string UploadFile(IFormFile file , string folderName)
        {
            var FolderPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Images", folderName);

            var FileName = $"{Guid.NewGuid()}{file.FileName}";

            var FilePath = Path.Combine(FolderPath, FileName);

            using var stream = new FileStream(FilePath, FileMode.Create);

            file.CopyTo(stream);

            return FileName;
        }

        public static void DeleteFile(string fileName , string folderName)
        {
            var FilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/Images", folderName, fileName);

            if(File.Exists(FilePath))
                File.Delete(FilePath);
        }
    }
}
