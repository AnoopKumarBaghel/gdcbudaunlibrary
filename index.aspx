<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebApplication5.index" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="slider">
        <div class="container">
            <div id="owl-demo" class="owl-carousel owl-theme">
                <div class="item">
                    <div class="slide">
                        <img src="images/slide1.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>product
                                <h5>Discover the best books online with us</h5>
                                <a href="products.aspx" class="btn">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide2.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.aspx" class="btn">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide3.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.aspx" class="btn">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="slide">
                        <img src="images/slide4.jpg" alt="slide1">
                        <div class="content">
                            <div class="title">
                                <h3>welcome to bookstore</h3>
                                <h5>Discover the best books online with us</h5>
                                <a href="products.aspx" class="btn">Download</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="about-sec">
        <div class="about-img">
            <figure style="background:url(./images/lib-img.jpg)no-repeat;"></figure>
        </div>
        <div class="about-content">
            <h2>About GDC BUDAUN Library,</h2>
            <p>A library is a place where many books are kept. Most libraries are public and let people take the books to use in their home. Most libraries let people borrow books for several weeks.</p>
            <p>Some belong to institutions, for example, companies, churches, schools, and universities. Also a person's bookshelves at home can have many books and be a library. The people who work in libraries are librarians. Librarians are people who take care of the library.</p>
            <div class="btn-sec">
                <a href="PRODUCTS.aspx" class="btn yellow">Download Online E-Books</a>
                </div>
        </div>
    </section>
   <section class="recomended-sec">
        <div class="container">
            <div class="title">
                <h2>Highly Recommendes Books/Apps</h2>
                <hr>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="item">
                        <img src="images/aarogya-setu.jpg" alt="img">
                        <h3>AArogya Setu App</h3>
                        <h6><span class="price"></span>  <a href="#">Download</a></h6>
                        <div class="hover">
                            <a href="https://play.google.com/store/apps/details?id=nic.goi.aarogyasetu&hl=en_IN">
                            <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="item">
                        <img src="images/covid.jpg" alt="img">
                        <h3>Covid Status</h3>
                        <h6><span class="price"></span>  <a href="#">View</a></h6>
                        <div class="hover">
                            <a href="https://www.mygov.in/covid-19"></a>
                           <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="item" >
                        <img src="images/book2.jpg" alt="img">
                        <h3>book 2 name</h3>
                        <h6><span class="price"></span> <a href="#">Download</a></h6>
                        <div class="hover">
                            <a href="https://google.com"></a>
                                <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <div class="item">
                        <img src="images/book4.jpg" alt="img">
                        <h3>wendy doniger</h3>
                        <h6><span class="price"></span>  <a href="google.com">Download</a></h6>
                        <div class="hover"><a href="https://google.com"></a>
                            <span><i class="fa fa-long-arrow-right" aria-hidden="true"></i></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="testimonial-sec">
        <div class="container">
            <div id="testimonal" class="owl-carousel owl-theme">
                <div class="item">
                    <h3>A book is a version of the world. If you do not like it, ignore it; or offer your own version in return.</h3>
                    <div class="box-user">
                        <h4 class="author">Salman Rushdie</h4>
                        <span class="country">England</span>
                    </div>
                </div>
                <div class="item">
                    <h3>I do believe something very magical can happen when you read a book</h3>
                    <div class="box-user">
                        <h4 class="author">J.K. Rowling</h4>
                        <span class="country">America</span>
                    </div>
                </div>
                <div class="item">
                    <h3>A reader lives a thousand lives before he dies, said Jojen. The man who never reads lives only one.</h3>
                    <div class="box-user">
                        <h4 class="author">George R.R. Martin</h4>
                        <span class="country">USA</span>
                    </div>
                </div>
                <div class="item">
                    <h3>The books that the world calls immoral are books that show the world its own shame.</h3>
                    <div class="box-user">
                        <h4 class="author">Oscar Wilde</h4>
                        <span class="country">France</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="left-quote">
            <img src="images/left-quote.png" alt="quote">
        </div>
        <div class="right-quote">
            <img src="images/right-quote.png" alt="quote">
        </div>
    </section>




</asp:Content>
