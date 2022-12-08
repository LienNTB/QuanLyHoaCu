function validateSignUpForm()
{
    var TenDangNhap=document.forms["SignUpForm"]["Username"].value
    var MatKhau=document.forms["SignUpForm"]["Password"].value
    var reMatKhau=document.forms["SignUpForm"]["Repassword"].value
    var Name=document.forms["SignUpForm"]["Name"].value
    var Birth=document.forms["SignUpForm"]["Birth"].value
    var Address=document.forms["SignUpForm"]["Address"].value
    if (TenDangNhap.Trim()=="")
    {
        alert("Vui lòng nhập tài khoản!")
        return false
    }
    if (MatKhau.Trim()=="")
    {
        alert("Vui lòng nhập mật khẩu!")
        return false
    }
    if (MatKhau.Trim()!="" && MatKhau.Trim() != reMatKhau.Trim() )
    {
        alert("Mật khẩu và xác nhận mật khẩu khác nhau!")
        return false
    }
    if (Name.Trim()!="")
    {
        alert("Vui lòng nhập họ và tên!")
        return false
    }
    if (Birth.Trim()!="")
    {
        alert("Vui lòng nhập ngày sinh!")
        return false
    }
    if (Address.Trim()!="")
    {
        alert("Vui lòng nhập địa chỉ!")
        return false
    }
    return true
}
function validateLoginForm()
{
    var Username=document.forms["LoginForm"]["Username"].value
    var Password=document.forms["LoginForm"]["Password"].value
    if (Username.Trim()=="")
    {
        alert("Vui lòng nhập tài khoản!")
        return false
    }
    if (Password.Trim()=="")
    {
        alert("Vui lòng nhập mật khẩu!")
        return false
    }
    return true
}