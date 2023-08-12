<%@ Page Title="" Language="C#" MasterPageFile="~/home-view/Home.master" AutoEventWireup="true" CodeFile="home-contact.aspx.cs" Inherits="home_view_home_contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="container">
            <nav class="breadcrumb bg-transparent m-0 p-0">
                <a class="breadcrumb-item" href="#">Home</a>
                <span class="breadcrumb-item active">Contact</span>
            </nav>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Contact Start -->
    <div class="container-fluid py-3">
        <div class="container">
            <div class="bg-light py-2 px-4 mb-3">
                <h3 class="m-0">Liên hệ với chúng tôi</h3>
            </div>
            <div class="row">
                <div class="col-md-5">
                    <div class="bg-light mb-3" style="padding: 30px;">
                        <h6 class="font-weight-bold">Get in touch</h6>
                        <p>Labore ipsum ipsum rebum erat amet nonumy, nonumy erat justo sit dolor ipsum sed, kasd lorem sit et duo dolore justo lorem stet labore, diam dolor et diam dolor eos magna, at vero lorem elitr</p>
                        <div class="d-flex align-items-center mb-3">
                            <i class="fa fa-2x fa-map-marker-alt text-primary mr-3"></i>
                            <div class="d-flex flex-column">
                                <h6 class="font-weight-bold">Our Office</h6>
                                <p class="m-0">123 Street, New York, USA</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center mb-3">
                            <i class="fa fa-2x fa-envelope-open text-primary mr-3"></i>
                            <div class="d-flex flex-column">
                                <h6 class="font-weight-bold">Email Us</h6>
                                <p class="m-0">info@example.com</p>
                            </div>
                        </div>
                        <div class="d-flex align-items-center">
                            <i class="fas fa-2x fa-phone-alt text-primary mr-3"></i>
                            <div class="d-flex flex-column">
                                <h6 class="font-weight-bold">Call Us</h6>
                                <p class="m-0">+012 345 6789</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="contact-form bg-light mb-3" style="padding: 30px;">
                        <div id="success" class="mb-4"><asp:Label ID="lblThongBao" runat="server" ></asp:Label></div>
                        <form name="sentMessage" id="contactForm" novalidate="novalidate">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="control-group">
                                        <label class="h5 px-1">Email :</label>
                                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email của bạn" CssClass="form-control p4"></asp:TextBox>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="h5 px-1">Tiêu đề :</label>
                                <asp:TextBox ID="txtTieude" runat="server" placeholder="Tiêu đề" CssClass="form-control p4"></asp:TextBox>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div class="control-group">
                                <label class="h5 px-1">Nội dung :</label>
                                <asp:TextBox ID="txtNoiDung" runat="server" placeholder="Nội dung" TextMode="MultiLine" CssClass="form-control p4"></asp:TextBox>
                                <p class="help-block text-danger"></p>
                            </div>
                            <div>
                                <asp:Button Id="btnSend" runat="server" CssClass="btn btn-primary font-weight-semi-bold px-4" style="height: 50px;" type="submit" Text="Gửi tin nhắn" OnClick="btnSend_Click"/>
                            </div>
                                                  
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
</asp:Content>

