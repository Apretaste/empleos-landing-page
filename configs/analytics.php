<?php

// only include Google Analytics for production
if(IS_PRODUCTION) { ?>
	<script async src="https://www.googletagmanager.com/gtag/js?id=G-T3DTEF5RJC"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag(){dataLayer.push(arguments);}
		gtag('js', new Date());
		gtag('config', 'G-T3DTEF5RJC');
	</script>
<?php } ?>
