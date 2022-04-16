rails g scaffold Post title:string description:text content:text

#breites Bild
rails g scaffold Post title:string description:text content:text --cover_display section

#Bild oben
rails g scaffold Page title:string description:text content:text --cover_display top

rails g add_cover Post

rails g tinymce Post

rails g tinymce Post --name_of_attribute content

rails g add_search_field Post

rails g add_many_to_many_relationship  Account --model slide
rails g add_many_to_many_relationship  Account --model option


<section class="page-cover-bg" style="background-image: url('<%%= url_cover %>'); height: <%%= height_of_cover %>px;">
    <div class="container d-flex align-items-start justify-content-center h-100 pt-2">

        <%%#= image_tag("logo_stinah_ws_vektor.png", class: "img-fluid mb-4 rounded overlay-darker", style: "height: 180px;") %>

    </div>
</section>

"https://player.vimeo.com/video/334631596?muted=1&amp;autoplay=1&amp;loop=1&amp;title=0&amp;byline=0&amp;portrait=0"

<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<link href="https://fonts.googleapis.com/css2?family=Montserrat&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css" integrity="sha256-0LjJurLJoa1jcHaRwMDnX2EQ8VpgpUMFT/4i+TEtLyc=" crossorigin="anonymous" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.js" integrity="sha256-TDtzz+WOGufaQuQzqpEnnxdJQW5xrU+pzjznwBtaWs4=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.0/animate.min.css" integrity="sha512-kb1CHTNhoLzinkElTgWn246D6pX22xj8jFNKsDmVwIQo+px7n1yjJUZraVuR/ou6Kmgea4vZXZeUDbqKtXkEMg==" crossorigin="anonymous" />
