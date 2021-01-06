

<div class="layui-upload">
    <button type="button" class="layui-btn" id="upload_{{$name}}">{{$title}}</button>
    <div class="layui-upload-list">
      
      <p id="demoText{{$name}}"></p>
    </div>
    <div id="file_{{$name}}" style="padding: 10px 0">
        <input type="hidden" name="{{$name}}"  value="{{$value}}">
        文件路径：<span>{{$value}}</span>
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
        ,accept: 'file' //普通文件
        ,before: function(obj){
          //预读本地文件示例，不支持ie8
          
        }
        ,done: function(res){
           layer.msg(res.msg);
          //如果上传失败
          if(res.code !== 0){
            return ;
          }
          //上传成功
          console.log(res.data)
          let return_field = "{{$return??'url'}}"
          $("#file_{{$name}}").find("input").val(res.data[0][return_field])
          $("#file_{{$name}}").find("span").html(res.data[0][return_field])
        }
        ,error: function(){
          //演示失败状态，并实现重传
          var demoText = $('#demoText{{$name}}');
          demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
          demoText.find('.demo-reload').on('click', function(){
            uploadInst.upload();
          });
        }
      });
      
      
      
       
      
    });
    </script>