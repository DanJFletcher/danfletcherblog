<?php
/**
 * Page: Home
 * 
 */
 
 // Requires/Includes go here.
 require('env.php');
 
 // Generate the header markup
 include('header.php');
 
?>

<!-- TODO: Add page content -->
        <main>
            <section class="project-description">
                <h1 class="patio-depot-heading">Patio Depot of Destin Florida</h1>
                <a class="btn patio-depot-btn" href="http://patiodepotofdestin.com/" target="_blank">Visit Site</a>
                <img class="project-thumbnail" src="<?= SITE_URL ?>/images/screenshots/patio_depot_landing_page.jpg" alt="Patio Depot landing page">
                
                <p>This was a fun one! The furniture that this company sells down in Florida is the same furniture that I used to machine and assemble while working for CRP Products Inc.</p>
                
                <p>The client accidentally removed their old site before this one was finished - so there was a huge push to get this launched as quickly as possible. After launching, the client made a sale through the site within 30 minutes of going live! It’s making a profit, but there is still a lot of testing and work to be done to get this site to an acceptable level of correctness.</p>
                
                <p>Concept and design was done by two of our designers at Redding Designs <a class="inline-link" href="#" target="_blank"><em>Corny Bartsch</em></a> and <a class="inline-link" href="#" target="_blank"><em>Vanessa Aubin</em></a>. Most of this site was programmed by me, with the help of one of our front-end devs, <a class="inline-link" href="#" target="_blank"><em>Frank Weibe</em></a>.</p>
            </section>
        </main>

<?php 

// Gernerate the footer markup
include('footer.php') 

?>



