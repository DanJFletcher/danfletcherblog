<?php 

/**
 * Template: Footer
 * 
 * Include any links to JavaScript files here, as well as the 
 * site's main footer section.
 * 
 */

?>

<!----------------------------- 
    Main Footer
    ---------------------------
    
    This section is where you place any repeatable footer content.
    
-->

<footer>
    <!-- TODO: Add site footer here -->
</footer>


<!-----------------------------
    JS Includes
    --------------------------- 
    
    Setting the ENV variable in .env to "production" will load vendor 
    scripts through a CDN.
    
    Setting the ENV variable in .env to "develop" will load vendor scripts
    from the /vendor directory.
    
    TODO: Discuss pros and cons of this configuration. 
        Should we reverse these variables?
    
-->

<!-- CDNs for production -->
<?php if (ENV === 'production') : ?>

    <!-- jQuery 2.2.4 -->
    <script   src="https://code.jquery.com/jquery-2.2.4.min.js"   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="   crossorigin="anonymous"></script>
    
    <!-- Owl 2.1.6 --beta -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.6/owl.carousel.min.js"></script>

<?php endif ?>


<!-- Hosted packages for development -->
<?php if (ENV === 'development') : ?>

    <!-- TODO: Check hosted version -->
    <script src="<?php echo SITE_URL ?>/vendor/jquery/jquery.min.js"></script>
    
    <!-- TODO: Check hosted version -->
    <script src="<?php echo SITE_URL ?>/vendor/bootstrap/bootstrap.min.js"></script>

<?php endif ?>


<!-- Load Custom Scripts -->
<script src="js/loader.js"></script>
<script src="js/plugins.js"></script>
<script src="js/smoothscroll.js"></script>

</body>
</html>