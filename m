Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2004edb5
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:29:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e9988b8
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:29:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2057555f
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:29:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 657eff71
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:29:39 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id 62so10728490oih.2
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 05:29:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <427618D1-5371-4D9E-81B3-2992CE84300C@danrl.com>
References: <CADdae-jTbEV27UJMTV8aABg7K0C1pCBhSejUc8yrBpNxwJ5ePw@mail.gmail.com>
 <427618D1-5371-4D9E-81B3-2992CE84300C@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Feb 2017 14:29:58 +0100
Message-ID: <CAHmME9piVNm-P5bUXti4pkJaGQ6fdM8-0+VvNPBrokmrKMdUYA@mail.gmail.com>
Subject: Re: [wireguard-devel] : wg output format
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
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

Hey guys,

Seems like this isn't the first request for such a thing. I'll
investigate better means of generating bulk output, and might
eventually converge on JSON for that. Will keep you posted.

Jason
