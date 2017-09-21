Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26119bc5
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:20:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31e8ce37
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:20:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6167aceb
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:39:13 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b425d5bc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 22:39:13 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id w94so14279857ioi.7
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 15:47:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170921194323.GC2587@gmail.com>
References: <20170921194323.GC2587@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Sep 2017 00:47:34 +0200
Message-ID: <CAHmME9pUqk-Di=R6Cj8dv9d=1PFrQCN__JibJ5-SOrdpwOTMZA@mail.gmail.com>
Subject: Re: Failure building on CentOS-7.4
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
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

Hey Konstantin,

You are using an old snapshot. Try upgrading to 20170918, which brings
CentOS 7.4 support.

Jason
