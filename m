Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e0efba4
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 20:48:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e12c6dbf
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 20:48:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15a22c50
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 21:02:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 107219cf
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 21:02:32 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id b6so31754552oia.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 14:05:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7F8F2DEF-6394-4169-8232-75781A45CA7D@veniamworks.com>
References: <7F8F2DEF-6394-4169-8232-75781A45CA7D@veniamworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Jun 2017 23:05:00 +0200
Message-ID: <CAHmME9qXR6_RByz5Uc8NhPUMwKU20tm=J5vZJsBYQEenEeQkVg@mail.gmail.com>
Subject: Re: openwrt reboot with high load using wireguard
To: Tiago Condeixa <tcondeixa@veniamworks.com>
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

Hi Tiago,

That's odd. What's the memory like on the system? Are you able to
capture a debug log via pstore or serial?

Thanks,
Jason
