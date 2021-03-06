<?php

namespace App\Http\Controllers\Products;

use App\Http\Controllers\Controller;
use App\Http\Requests\DestroyProductRequest;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\traits\media;
class ProductController extends Controller
{
    use media;
    public function index()
    {
        $products = DB::table('products')->select('id','name_en','price','status','quantity','created_at')->get();
        return view('products.index',compact('products'));
    }
    public function create()
    {
        $brands = DB::table('brands')->select('id','name_en')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en')->get();
        return view('products.create',compact('brands','subcategories'));
    }
    public function edit($id)
    {
        $product = DB::table('products')->where('id',$id)->first(); 
        $brands = DB::table('brands')->select('id','name_en')->get();
        $subcategories = DB::table('subcategories')->select('id','name_en')->get();
        return view('products.edit',compact('product','brands','subcategories'));
    }

    public function store(StoreProductRequest $request)
    {

        $data = $request->except('_token','image','page');
        // upload photo
        $data['image'] = $this->upload($request->image,'products');
        // insert into database
        DB::table('products')->insert($data);
        // success message according to request
        return $this->returnAccordingToRequest($request);
    }


    public function update(UpdateProductRequest $request,$id)
    {

        $data = $request->except('_token','_method','image','page'); 
       
        if($request->has('image')){
           
            $data['image'] = $this->upload($request->image,'products');
            
            $oldPhotoName = DB::table('products')->select('image')->where('id',$id)->first()->image;
            
            $this->delete($oldPhotoName,'products');
        }
        
        DB::table('products')->where('id',$id)->update($data);
        
        return $this->returnAccordingToRequest($request);
    }

    public function destroy(DestroyProductRequest $request)
    {
        $oldPhotoName = DB::table('products')->select('image')->where('id',$request->id)->first()->image;
        $this->delete($oldPhotoName,'products');
        DB::table('products')->where('id',$request->id)->delete(); 
        return redirect()->back()->with('success','Operation Successfull');
    }


    private function returnAccordingToRequest(Request $request){
        if($request->page == 'back'){
            return redirect()->back()->with('success','Operation Successfull');
        }else{
            return redirect()->route('dashboard.products.index')->with('success','Operation Successfull');
        }
    }
}
