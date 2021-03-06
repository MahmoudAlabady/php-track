<?php

namespace App\Http\traits;

trait media {
    public function upload($image,$folder)
    {
        $photoName = time() . '.' . $image->extension(); 
        $image->move(public_path("images\\$folder\\"),$photoName); 
        return $photoName;
    }

    public function delete($photoName,$folder)
    {
        $oldPhotoPath = public_path("images\\$folder\\$photoName");
        if(file_exists($oldPhotoPath)){
            unlink($oldPhotoPath);
            return true;
        }
        return false;
    }
}