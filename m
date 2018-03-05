Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 035ccaf2
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:34:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c0b16a9
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:34:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6db72315
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:25:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c28dc6b8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 19:25:34 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id c12so12979751oic.7
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 11:43:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7dPyiqBYCNedFc6cPyGCh3j4RmO7fKU+BNsH4g8T2dJKw@mail.gmail.com>
References: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
 <9de22427-0180-ac5a-cd7c-b5f9810ecbf9@posteo.net>
 <CAKXLc7dPyiqBYCNedFc6cPyGCh3j4RmO7fKU+BNsH4g8T2dJKw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Mar 2018 20:43:41 +0100
Message-ID: <CAHmME9qD66Yg1UJ418P2FEkGj3FvFSonhP=S3p0t8hEPOeRP-g@mail.gmail.com>
Subject: Re: Update: exempting two things from WireGuard tunneling
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
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

Use the ipset= feature of dnsmasq, and then use policy routing on that ipset.
