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
        <h1>Login to access to<br />your account</h1>
    
        <div class="login-form">
          <form id="formLogin" runat="server">
            <input type="email" placeholder="E-mail Address">
            <input type="password" placeholder="Password">

            <div class="remember-form">
              <input type="checkbox">
              <span>Remember me</span>
            </div>
            <div class="forget-pass">
              <a href="#">Forgot Password ?</a>
            </div>

            <button type="submit">LOG-IN</button>

          </form>
        </div>
    
      </div>
      </div>
  </div>
</body>
</html>
