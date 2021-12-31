<?php

namespace App\Http\Controllers\apis;

use App\Http\Controllers\Controller;
use App\Http\Requests\DestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Subcategory;
use Illuminate\Http\Request;
use App\Http\traits\media;
use App\Http\traits\ApiTrait;
class ProductController extends Controller
{
    use media,ApiTrait;
    public function index()
    {
        $products = Product::all(); 
        return $this->Data(compact('products'));
    }

    public function create()
    {
        $brands = Brand::select('id','name_en')->orderBy('name_en')->get();
        $subcategories = Subcategory::select('id','name_en')->orderBy('name_en')->get();
        return $this->Data(compact('brands','subcategories'));
    }

    public function edit($id)
    {
        $product = Product::find($id);
        $brands = Brand::select('id','name_en')->orderBy('name_en')->get();
        $subcategories = Subcategory::select('id','name_en')->orderBy('name_en')->get();
        return $this->Data(compact('product','brands','subcategories'));
    }

    public function store(StoreProductRequest $request)
    {
        $data = $request->except('image');
        $data['image'] = $this->upload($request->image,'products');
        Product::insert($data);
        return $this->SuccessMessage('Product Created Successfully',201);
    }

    public function update(UpdateProductRequest $request,$id)
    {
        if(Product::where('id',$id)->exists()){
            $data = $request->except('image','_method'); 
            if($request->has('image')){
                $data['image'] = $this->upload($request->image,'products');
                $oldPhotoName = Product::select('image')->where('id',$id)->first()->image;
                $this->delete($oldPhotoName,'products');
            }
            Product::where('id',$id)->update($data);
            return $this->SuccessMessage('Product Updated Successfully',200);
        }else{
            $id = "selected Id Is Invalid";
            return $this->ErrorMessage(compact('id'),'Product Not Found',404);
        }
       
    }

    public function destroy(DestroyProductRequest $request)
    {
        $oldPhotoName = Product::select('image')->where('id',$request->id)->first()->image;
        $this->delete($oldPhotoName,'products');
        Product::where('id',$request->id)->delete(); 
        return  $this->SuccessMessage('Product deleted Successfully',200);
    }
}
