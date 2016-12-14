Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cde2036
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7da8b8c
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2dcbdf2
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f542f050
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:06:25 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f82so14806193wmf.1
 for <wireguard@lists.zx2c4.com>; Wed, 14 Dec 2016 13:12:44 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161214210740.35426-1-mail@danrl.com>
References: <20161214210740.35426-1-mail@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Dec 2016 22:12:42 +0100
Message-ID: <CAHmME9r4kdAbd3yyvEnn7KebpmnyzhmW6efp8NQwm69pDHa9+Q@mail.gmail.com>
Subject: Re: [PATCH] tools: fixed typo in wg-show usage
To: danrl <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Dan,

Thanks. The typo was in the opposite place, which I fixed and give you
credit for the report:

https://git.zx2c4.com/WireGuard/commit/?id=309fbe630fccc397e13d57956f0847fc7a2eaf90

This will be part of the next snapshot.

Jason
