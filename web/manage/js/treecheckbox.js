/**
 * Created with IntelliJ IDEA.
 * User: wangdy
 * Date: 14-1-11
 * Time: 下午2:27
 * To change this template use File | Settings | File Templates.
 */
    // 选择所有
function selectAll(checkedValue){

    $("[name=resourceIds]").attr("checked", checkedValue);
}

$(function(){
    $("#tree").treeview()

    // 点击某项时应做相应的选择或取消上下级的操作
    $("[name=resourceIds]").click(function(){
        var checkedValue = this.checked; // 当前复选框的选中状态
        if(checkedValue){// 选中一个权限时
            // 应该选中他的所有直系上级
            $(this).parent().parents("li").children("[name=resourceIds]").attr("checked", true);
            // 应该选中他的所有直系下级
            $(this).parent().find("li>[name=resourceIds]").attr("checked", true);
            var checkallstatus=true;
            $('input[type="checkbox"][name="resourceIds"]').each(
                function() {
                    if(!this.checked)
                        checkallstatus=false;
                }
            );
            if(checkallstatus)
                $("[id=cbSelectAll]").attr("checked", checkallstatus);

        }else{
            // 取消选择一个权限时：应该取消选择 他的所有直系下级
            $(this).parent().find("li>[name=resourceIds]").attr("checked", false);
            // 如果我是把最后一个选项取消了，则上级也取消
            if( $(this).parent().siblings("li").children("[name=resourceIds]:checked").size() == 0 ){
                $(this).parent().parent().siblings("[name=resourceIds]").attr("checked", false);

                // 如果我是第3级，则还需要判断上级的上级是否需要取消
                if( $(this).parent().parent().parent().siblings("li").children("[name=resourceIds]:checked").size() == 0 )
                {


                    $(this).parent().parent().parent().parent().siblings("[name=resourceIds]").attr("checked", false);
                }
            }





            $("[id=cbSelectAll]").attr("checked", false);
        }
    });
});