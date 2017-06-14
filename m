Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fa2fa2f
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 11:33:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c482c3e0
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 11:33:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3e3a409
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 11:47:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1abe7886
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jun 2017 11:47:28 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id s3so85663642oia.0
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jun 2017 04:48:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3bd46519-ee20-8b1a-ca88-95b60bbc9e81@cis-india.org>
References: <3bd46519-ee20-8b1a-ca88-95b60bbc9e81@cis-india.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Jun 2017 13:48:45 +0200
Message-ID: <CAHmME9rRBxMvHMkGMRchDoDU1Ok7_J-nxCKydg6oo=3O+1b00g@mail.gmail.com>
Subject: Re: Trouble running a proxy VPN
To: Pranesh Prakash <pranesh@cis-india.org>
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

Looks like maybe you forgot to enable IP forwarding and masquerading
on the server.
