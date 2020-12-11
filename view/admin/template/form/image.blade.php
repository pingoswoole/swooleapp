<input type="hidden" name="{{$name}}" id="image_{{$name}}" value="{{$value}}">
<div class="layui-upload">
    <button type="button" class="layui-btn" id="upload_{{$name}}">{{$title}}</button>
    <div class="layui-upload-list">
      <img class="layui-upload-img" id="preview_{{$name}}">
      <p id="demoText"></p>
    </div>
</div>   

<script>
    layui.use('upload', function(){
      var $ = layui.jquery
      ,upload = layui.upload;
      
      //普通图片上传
      var uploadInst = upload.render({
        elem: '#upload_{{$name}}'
        ,url: '/backend/upload/handle' //改成您自己的上传接口
        ,before: function(obj){
          //预读本地文件示例，不支持ie8
          obj.preview(function(index, file, result){
            $('#preview_{{$name}}').attr('src', result); //图片链接（base64）
          });
        }
        ,done: function(res){
          //如果上传失败
          if(res.code !== 0){
            return layer.msg('上传失败');
          }
          //上传成功
          $("#image_{{$name}}").val(res.data[0])
        }
        ,error: function(){
          //演示失败状态，并实现重传
          var demoText = $('#demoText');
          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
          demoText.find('.demo-reload').on('click', function(){
            uploadInst.upload();
          });
        }
      });
      
      
      
       
      
    });
    </script>