Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17b484dd
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 20:14:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53188570
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 20:14:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76402e0a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 20:14:04 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id l188so19213572lfe.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2016 13:16:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160628200215.14423-1-list@eworm.de>
References: <20160628200215.14423-1-list@eworm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jun 2016 22:16:38 +0200
Message-ID: <CAHmME9okkkwQD_zd90UBJ31ughmTSAbmhfVnr_5abtfA6+qyvw@mail.gmail.com>
To: Christian Hesse <list@eworm.de>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>, wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] [PATCH 1/1] add DKMS configuration file
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Christian,

Good to see you in this neck of the lists.zx2c4.com woods! :P

I see you saw my call for DKMS in the roadmap page?

I haven't looked into the innerworkings of DKMS yet, but is this
essentially how it works? We put this file in src/, and then
everything is taken care of? Are their other flags and switches and
variables to take into account? Or is this pretty much it?

Jason
