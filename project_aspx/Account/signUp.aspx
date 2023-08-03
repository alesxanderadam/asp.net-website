<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signUp.aspx.cs" Inherits="Account_signUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>

    <link href="style/login.css" rel="stylesheet" />

</head>
<body>

    <div class="parent clearfix">
        <div class="bg-illustration">
            <img src="https://i.ibb.co/Pcg0Pk1/logo.png" alt="logo">

            <div class="burger-btn">
                <span></span>
                <span></span>
                <span></span>
            </div>

        </div>

        <div class="login">
            <div class="container">
                <h1>Đăng ký để<br />
                    sử dụng tài khoản</h1>

                <div class="login-form">
                    <form id="formLogin" runat="server">
                        <asp:TextBox ID="Email" runat="server" type="email" placeholder="Nhập email" />
                        
                        <asp:TextBox ID="Password" runat="server" placeholder="Nhập lại mật khẩu" type="password" />
                         <div class="remember-form">
                            <asp:TextBox ID="rememberMe" runat="server" type="checkbox" />
                            <span></span>
                        </div>
                        <div class="forget-pass">
                            <a href="signIp.aspx">Đã có tài khoản </a>
                        </div>
                        <%--<button type="submit">Đăng nhập</button>--%>
                        <asp:Button ID="submitLogin" runat="server" OnClick="submitRegister_Click" Text="Đăng ký" />

                    </form>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
