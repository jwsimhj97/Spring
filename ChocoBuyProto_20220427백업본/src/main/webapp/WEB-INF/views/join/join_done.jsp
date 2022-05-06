<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- BOOTSTRAP 4.0 -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="../css/join_style.css">
<script type="text/javascript" src="../js/user_join.js"></script>
<title>회원가입 | 초코바이</title>
</head>
<body>
<div class="js-container container">
	<h1>회원가입이 완료되었습니다!</h1>
	<span>로그인 후에 초코바이의 모든 서비스를 이용해보세요</span>
	<button type="button" class="done_next_btn">로그인하기</a></button>
</div>
<script>
const Confettiful = function (el) {
	  this.el = el;
	  this.containerEl = null;

	  this.confettiFrequency = 3;
	  this.confettiColors = ["#fce18a", "#ff726d", "#b48def", "#f4306d"];
	  this.confettiAnimations = ["slow", "medium", "fast"];

	  this._setupElements();
	  this._renderConfetti();
	};

	Confettiful.prototype._setupElements = function () {
	  const containerEl = document.createElement("div");
	  const elPosition = this.el.style.position;

	  if (elPosition !== "relative" || elPosition !== "absolute") {
	    this.el.style.position = "relative";
	  }

	  containerEl.classList.add("confetti-container");

	  this.el.appendChild(containerEl);

	  this.containerEl = containerEl;
	};

	Confettiful.prototype._renderConfetti = function () {
	  this.confettiInterval = setInterval(() => {
	    const confettiEl = document.createElement("div");
	    const confettiSize = Math.floor(Math.random() * 3) + 7 + "px";
	    const confettiBackground = this.confettiColors[
	      Math.floor(Math.random() * this.confettiColors.length)
	    ];
	    const confettiLeft = Math.floor(Math.random() * this.el.offsetWidth) + "px";
	    const confettiAnimation = this.confettiAnimations[
	      Math.floor(Math.random() * this.confettiAnimations.length)
	    ];

	    confettiEl.classList.add(
	      "confetti",
	      "confetti--animation-" + confettiAnimation
	    );
	    confettiEl.style.left = confettiLeft;
	    confettiEl.style.width = confettiSize;
	    confettiEl.style.height = confettiSize;
	    confettiEl.style.backgroundColor = confettiBackground;

	    confettiEl.removeTimeout = setTimeout(function () {
	      confettiEl.parentNode.removeChild(confettiEl);
	    }, 3000);

	    this.containerEl.appendChild(confettiEl);
	  }, 25);
	};

	window.confettiful = new Confettiful(document.querySelector(".js-container"));
</script>
</body>
</html>