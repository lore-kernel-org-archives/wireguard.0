Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8342e61f
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 10:57:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d044dcd4
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 10:57:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45cd1c51
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 10:57:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17b94948
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 10:57:58 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id g104so27067060otg.7
 for <wireguard@lists.zx2c4.com>; Tue, 28 Nov 2017 03:03:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171128074947.2212-2-yuanchao.sun@gmail.com>
References: <20171128074947.2212-1-yuanchao.sun@gmail.com>
 <20171128074947.2212-2-yuanchao.sun@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Nov 2017 12:03:49 +0100
Message-ID: <CAHmME9pUk6pdp5VtGKaebAB70mcz+D_nW8E1vCRhm-jQzm6Bjw@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools: remove '\n' in fscanf format-string
To: Yuanchao Sun <yuanchaosun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

Thanks for the patch. In the future, please include your Signed-off-by
line and include the explanation in the body of the commit where it
will be recorded in the future.

I'm not sure this patch is correct. The /xplatform spec mandates an
empty line. This patch enforces that. What is the purpose of removing
that requirement?

Also, I'm curious to learn what you're doing with this API at this early stage.

Regards,
Jason
