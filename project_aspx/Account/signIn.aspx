<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signIn.aspx.cs" Inherits="Account_signIn" %>

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
                <h1>Đăng nhập để<br />
                    sử dụng tài khoản</h1>

                <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>

                <div class="login-form">
                    <form id="formLogin" runat="server">
                        <asp:TextBox ID="Email" runat="server" type="email" placeholder="Nhập email" />
                        <asp:TextBox ID="Password" runat="server" placeholder="****" type="password" />

                        <div class="remember-form">
                            <asp:TextBox ID="rememberMe" runat="server" type="checkbox" />
                            <span>Ghi nhớ tôi</span>
                        </div>
                        
                        <div class="forget-pass">
                            <a href="signUp.aspx">Đăng ký tài khoản </a>
                        </div>
                        <asp:Button ID="submitLogin" runat="server" OnClick="submitLogin_Click" Text="Đăng nhập" />

                    </form>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
