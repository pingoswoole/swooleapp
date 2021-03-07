

<div class="layui-upload">
    
    <button type="button" class="layui-btn layui-btn-normal" id="uploadmore_{{$name}}">{{$title??'上传多图'}}</button>
    <div class="layui-upload-list">
        <table class="layui-table">
        <thead>
            <tr><th>图片</th>
            {{-- <th>大小</th> --}}
            <th>状态</th>
            <th>操作</th>
        </tr></thead>
        <tbody id="piclist_{{$name}}">

             @if (!empty($value))
                 @foreach ($value as $item)
                 <tr>
                     <td><img with="69px" src="{{$item}}"><input type="hidden" name="{{$name}}[]" value="{{$item}}"></td>
                    {{-- <th>大小</th> --}}
                    <td> </td>
                    <td>
                        <span class="layui-btn layui-btn-xs layui-btn-danger demo-delete" onclick="$(this).parent().parent().remove()">删除</span>
                    </td>
                  </tr>
                 @endforeach
             @endif
            
        </tbody>
        </table>
    </div>
    <button type="button" class="layui-btn layui-hide" id="{{$name}}Action">开始上传</button>
</div>   

<script>
    layui.use('upload', function(){
      var $ = layui.jquery
      ,upload = layui.upload;
      
       //多文件列表示例
        var picListView = $('#piclist_{{$name}}')
        ,uploadListIns = upload.render({
        elem: '#uploadmore_{{$name}}'
        ,url: '/backend/upload/handle' //改成您自己的上传接口
        ,accept: 'file'
        ,multiple: true
        ,auto: true
        ,bindAction: '#{{$name}}Action'
        ,choose: function(obj){   
            var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
            //读取本地文件
            obj.preview(function(index, file, result){
                
            var tr = $(['<tr id="upload-'+ index +'">'
                ,'<td><img with="69px" src="'+ result +'"></td>'
                //,'<td>'+ (file.size/1024).toFixed(1) +'kb</td>'
                ,'<td>等待上传</td>'
                ,'<td>'
                ,'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>'
                ,'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
                ,'</td>'
            ,'</tr>'].join(''));
            
            //单个重传
            tr.find('.demo-reload').on('click', function(){
                obj.upload(index, file);
            });
            
            //删除
            tr.find('.demo-delete').on('click', function(){
               delete files[index]; //删除对应的文件
               tr.remove();
               uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
            });
            
            picListView.append(tr);
            });
        }
        ,done: function(res, index, upload){
            if(res.code === 0){ //上传成功
                var tr = picListView.find('tr#upload-'+ index)
                ,tds = tr.children();
                tds.eq(1).html('<span style="color: #5FB878;">上传成功</span><input type="hidden" name="{{$name}}[]" value="'+res.data[0]['url']+'">');
               //tds.eq(2).html(''); //清空操作
                return delete this.files[index]; //删除文件队列已经上传成功的文件
            }
            this.error(index, upload);
        }
        ,error: function(index, upload){
            var tr = picListView.find('tr#upload-'+ index)
            ,tds = tr.children();
            tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
            tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
        }
        });

      
    });
    </script>