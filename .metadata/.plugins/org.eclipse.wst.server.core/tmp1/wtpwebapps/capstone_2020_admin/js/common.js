/**
 * 순수한 자바스크립트가 아닌 jQuery를 이용하여 함수를 짬
 * 이를 위해서는 jQuery를 추가해줘야함
 */
function gfn_isNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;   
 
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;   
    if (chkStr.toString().length == 0 ) return true;  
    return false;
}
 
function ComSubmit(opt_formId) {
    this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.url = "";
 
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#" + this.formId).append( $( "<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >" ) );
    };
     
    this.submit = function submit(){
        var frm = $("#" + this.formId)[0];
        frm.action = this.url;
        frm.method = "post";
        frm.submit();  
    };
}
