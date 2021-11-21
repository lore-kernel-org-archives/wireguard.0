Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE336C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Nov 2021 00:31:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 82f5eae1;
	Sun, 21 Nov 2021 00:31:56 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2537aeec
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Nov 2021 00:31:54 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 8so12543402pfo.4
 for <wireguard@lists.zx2c4.com>; Sat, 20 Nov 2021 16:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxGWmTZwHsm0RN01kjRmL3HzDw86SFLpP/0ZpXpaZRc=;
 b=mqLPe+mzN9Dl/E2s2wRLW9ghNZxzkxV9cQ7rzDcRi9/vEWM/1M/T9ZtHoNE4KsrZ5j
 0dUrpsPnoEXXwUde09T2wZxbStgM88DZvGgmc0978ncxOd0TJDgINT5vSKtNkNjbTJUo
 9aK6twgJ7kHLOHU+XH7Ad1bYAiBkodz9okdE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XxGWmTZwHsm0RN01kjRmL3HzDw86SFLpP/0ZpXpaZRc=;
 b=GJvyGHektdr67BgwO1OmkBr79ArbSaJ5jiuMYjjcA6m3JJrlIOSIDra987DBR8I1Ff
 lKzsXbpmRID1PO239a4GaA5/+uYtEg+gnisPe0vP6IKY3fZ4faRaU+C7/XSdoaNdOVyN
 BEyfT9dS0GP+NCFRQzUnWjh7f1k9vit18a6eJRwhxyVtugcNe6tF253ayVowBBaXHxS0
 X30X/qKIclkgcnDy/CvAaMtvLX9Bq/NJ8F5mA2mKvt/LdRTWQ57cnbiG60k036mqyv17
 nEF5Tg+OWh+y7mGW91vGH0QJ4t/KlTNB7752866prBbHt08dVfu3Wbk31J57G3L3tb0V
 JYWA==
X-Gm-Message-State: AOAM530jNcTHiOHhQqAJVwrf8P6NXt0K+/M+59TTy0fYGZ9O8cDIwgfl
 OBj5xAboo/kd4fXA6SZIfN0ccw==
X-Google-Smtp-Source: ABdhPJx48K+tBtBfbJQf3sSRXIucI8Y6zCrUy5h3//aCrSN9nw8UbzVlU9gBgDoTvSGJtDP7M2mUdg==
X-Received: by 2002:a05:6a00:2351:b0:47b:d092:d2e4 with SMTP id
 j17-20020a056a00235100b0047bd092d2e4mr73088775pfj.76.1637454712802; 
 Sat, 20 Nov 2021 16:31:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j127sm3932775pfg.14.2021.11.20.16.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 16:31:52 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 Alexander Lobakin <alobakin@pm.me>, Jakub Sitnicki <jakub@cloudflare.com>,
 Marco Elver <elver@google.com>, Willem de Bruijn <willemb@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Eric Dumazet <edumazet@google.com>, Cong Wang <cong.wang@bytedance.com>,
 Paolo Abeni <pabeni@redhat.com>, Talal Ahmad <talalahmad@google.com>,
 Kevin Hao <haokexin@gmail.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Vasily Averin <vvs@virtuozzo.com>, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, bpf@vger.kernel.org,
 llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: [PATCH v2 net-next 0/2] skbuff: Switch structure bounds to
 struct_group()
Date: Sat, 20 Nov 2021 16:31:47 -0800
Message-Id: <20211121003149.28397-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=654; h=from:subject;
 bh=JyIoux+3mSqRrP5c5yAm1k2PCuE3ujZ9X+hh+TTSdkw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhmZN06M3ei451eaMBJ4tlO/hieAlz+BhYFDkIdlX1
 eX61FpWJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYZmTdAAKCRCJcvTf3G3AJtbrD/
 9eR2KNvgCn/YPwypnUGU/RNNqA4O4bYEFLj4ElzB1qqQlG2RgJdcz+rq2yQisqqs16klI6tC11SBhN
 W7udXMhGJ+Py7w1vVEBAjVNZmGKGlJXE5U8WAHjfZcQac0sOe4DaoyxEKDhZ4dVEtfM9n+INWySh7M
 uDr1c3vaP+cgXlX5lMFiVoFtjG416sLde9ZZ8i/AAoEtj13SqOYM69cCvB3ZV5sD6z171ju8LuL8V0
 0/gPsQggl4r2PI9mSi0ATgA4nL9uxPXZ+WimwvtpoW3euJOXl3R5qx7YEJpMVEhQb+h7bsHU8+554G
 Mr/5XtAumV32/xkgbaaZzuXsqDpE7wlAaVucANa3AQEj21s9tjkelAJu7HA0AlFNxD1vdytn7CWZlk
 pZMaqvAW5drzcrEzYLOo+fXRjVbz/qGY1eHIl8O1AdM1Yl5bxOyoHeJ6+Bh5Bgajfi3DtMZFSy3y9b
 OpoS11g+KF4T5o4t9R3wBjQCyP+hGBmGNCpm6N3kBHTnOLW1hoF9P7WSGHblOL5gn/lWS1rXatOn5H
 Vacu7NXyluL8MFDh6ynTM7+DGECqimJOIry6vmwHNkpv8jjqqF+jTWDoJGkFAn2/aA49Zpg/XonIcy
 94jGLJObRNcJnXtDPIWtQUQA7/UNnVofu/gJMtbIHUh4j4L/74FL/AmwVMfg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

This is a pair of patches to add struct_group() to struct sk_buff. The
first is needed to work around sparse-specific complaints, and is new
for v2. The second patch is the same as originally sent as v1.

-Kees

Kees Cook (2):
  skbuff: Move conditional preprocessor directives out of struct sk_buff
  skbuff: Switch structure bounds to struct_group()

 drivers/net/wireguard/queueing.h |  4 +--
 include/linux/skbuff.h           | 46 +++++++++++++++-----------------
 net/core/filter.c                | 10 +++----
 net/core/skbuff.c                | 14 ++++------
 4 files changed, 33 insertions(+), 41 deletions(-)

-- 
2.30.2

