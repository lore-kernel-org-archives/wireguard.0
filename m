Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a16a53e1
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Apr 2017 19:46:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5335759
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Apr 2017 19:46:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dff79b1f
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Apr 2017 19:46:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55c50929
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Apr 2017 19:46:49 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id x184so65947246oia.1
 for <wireguard@lists.zx2c4.com>; Thu, 20 Apr 2017 12:54:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <86D45CDF-9845-42E0-B89B-C51DE9E3A4BE@inspeednetworks.com>
References: <86D45CDF-9845-42E0-B89B-C51DE9E3A4BE@inspeednetworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Apr 2017 21:54:52 +0200
Message-ID: <CAHmME9qkARe7O_ERjKGe26v08CE7zTTdN8nodmf=8f3TSEbGWg@mail.gmail.com>
Subject: Re: Installing and 'quick starting' on CentOS 7
To: Craig Marker <cmarker@inspeednetworks.com>
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

CentOS 7 doesn't actually use a real 3.10 kernel. They've backported
tons of things. I almost got it to compile by fooling the compat
codebase into thinking I was "3.18.100", which sort of worked, until
it got to the udp_tunnel maze. If you want to work through it and come
up with a patch, maybe you can convince the maintainer of the centos
package for wireguard to ship that patch. You're probably best off,
though, using a non weird kernel.
