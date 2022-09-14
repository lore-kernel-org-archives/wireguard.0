Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550E2C6FA89
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Sep 2022 00:55:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 25a7fef5;
	Wed, 14 Sep 2022 00:55:44 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a68ead11
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Sep 2022 00:55:43 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 78so12855461pgb.13
 for <wireguard@lists.zx2c4.com>; Tue, 13 Sep 2022 17:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=5vV4CilzLiWjPs5xReufWS8ipvCGneLgr8C9TBkLjw0=;
 b=nhcftbz0F+5FieX2xbd8segHsRucGIuOwKvgYMu9lmxrssK8PpwDOXEh1Rw+Esp+dz
 MilZoQWwJc4vabWLbqbTFAMTOE7qQ9msTC0w/k0ZfPeJCRS1vgzLelZxU3M2p0uFJ5QU
 Cx6QDJlBXVOWNqdDgdJ4l/sQx4KTcvP2b1hrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=5vV4CilzLiWjPs5xReufWS8ipvCGneLgr8C9TBkLjw0=;
 b=OyWCpnXsovl5Fm641EnKGlt/eD2LY8Qc9I7yVH2yG40E8RrqQAtKgZcytYOHqhOksx
 Mh+C/rmCRuKI3gcXM6m0U3o3xrA4RloOp11mRGQim3lnQwJ4GrJ9ncQCpjf1P8WQeNTU
 M6ImE/OR8Zv/Dzwmbv+MYzLIv9461ZhEo02SUpCHWu0y0IK5CLT2mOguYoYSIjkp7r/J
 F753/PCAqkaqz4N7E87nIvVlN1mAudMRugSwSa/2lzJg2xPul4ApvY7JTjZhJQVIIoJp
 KiajiQv4EeGPBk8z68y+0RN7utDxlJTuyKi2ocmwXn4rLnXmPpjSiZUFdJQuhU4mnWF1
 jRHA==
X-Gm-Message-State: ACgBeo2BHcjgeFwrOdupiCKA/JAwf/nDqLm/n83uhAMXaf8Aap4xR2Go
 HxOTti2pA2s5Yz7mPJF1voSpBQ==
X-Google-Smtp-Source: AA6agR48k91enu7+uh/AQ4joZbHAihyt0j9hntaWvaNHhQzbmNpt+4siuaaNR8At8OdvW016llHErg==
X-Received: by 2002:a63:fb0e:0:b0:434:efad:10c8 with SMTP id
 o14-20020a63fb0e000000b00434efad10c8mr28905882pgh.316.1663116941537; 
 Tue, 13 Sep 2022 17:55:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i32-20020a17090a3da300b001fbb0f0b00fsm7846674pjc.35.2022.09.13.17.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Sep 2022 17:55:40 -0700 (PDT)
Date: Tue, 13 Sep 2022 17:55:39 -0700
From: Kees Cook <keescook@chromium.org>
To: Jason@zx2c4.com
Cc: syzbot <syzbot+a448cda4dba2dac50de5@syzkaller.appspotmail.com>,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, sfr@canb.auug.org.au,
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Subject: Re: [syzbot] linux-next test error: WARNING in set_peer
Message-ID: <202209131753.D1BDA803@keescook>
References: <00000000000060a74405e8945759@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00000000000060a74405e8945759@google.com>
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

On Tue, Sep 13, 2022 at 12:51:42PM -0700, syzbot wrote:
> memcpy: detected field-spanning write (size 28) of single field "&endpoint.addr" at drivers/net/wireguard/netlink.c:446 (size 16)

This is one way to fix it:

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 0c0644e762e5..dbbeba216530 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -434,16 +434,16 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 	}
 
 	if (attrs[WGPEER_A_ENDPOINT]) {
-		struct sockaddr *addr = nla_data(attrs[WGPEER_A_ENDPOINT]);
+		struct endpoint *raw = nla_data(attrs[WGPEER_A_ENDPOINT]);
 		size_t len = nla_len(attrs[WGPEER_A_ENDPOINT]);
 
 		if ((len == sizeof(struct sockaddr_in) &&
-		     addr->sa_family == AF_INET) ||
+		     raw->addr.sa_family == AF_INET) ||
 		    (len == sizeof(struct sockaddr_in6) &&
-		     addr->sa_family == AF_INET6)) {
+		     raw->addr.sa_family == AF_INET6)) {
 			struct endpoint endpoint = { { { 0 } } };
 
-			memcpy(&endpoint.addr, addr, len);
+			memcpy(&endpoint.addrs, &raw->addrs, len);
 			wg_socket_set_peer_endpoint(peer, &endpoint);
 		}
 	}
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 76e4d3128ad4..4fbe7940828b 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -19,11 +19,13 @@
 struct wg_device;
 
 struct endpoint {
-	union {
-		struct sockaddr addr;
-		struct sockaddr_in addr4;
-		struct sockaddr_in6 addr6;
-	};
+	struct_group(addrs,
+		union {
+			struct sockaddr addr;
+			struct sockaddr_in addr4;
+			struct sockaddr_in6 addr6;
+		};
+	);
 	union {
 		struct {
 			struct in_addr src4;


diffoscope shows the bounds check gets updated to the full union size:
│ -     cmp    $0x11,%edx
│ +     cmp    $0x1d,%edx

and the field name changes in the warning:
$ strings clang/drivers/net/wireguard/netlink.o.after | grep ^field
field "&endpoint.addrs" at drivers/net/wireguard/netlink.c:446


-- 
Kees Cook
