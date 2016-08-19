Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72e4be26
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:48:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd24b110
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:48:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f875ed2f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Aug 2016 12:48:54 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id b199so32325115lfe.0
 for <wireguard@lists.zx2c4.com>; Fri, 19 Aug 2016 05:54:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ozzYBLJ-0xMocFbWuHWCDsONuVqS_hQpVtWJtMKspd5g@mail.gmail.com>
References: <acb454d0c202fc330d0a349aeee29256@mail.inwebse.com>
 <CAHmME9ozzYBLJ-0xMocFbWuHWCDsONuVqS_hQpVtWJtMKspd5g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Aug 2016 14:54:24 +0200
Message-ID: <CAHmME9pZmAi9tjOzZL178f3tM1MYCQZFR-VFR-bJd0S1FFMruA@mail.gmail.com>
To: sorcus@inwebse.com
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard doesn't work with network namespace on
	ArchLinux
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

>> $ cat /etc/wireguard/client.conf
>> [Interface]
>> PrivateKey = OAT5r6E1hid***iVBnY=

Never post any part of your private key to the internet. I advise you
to change your keys now.


>> ListenPort = 52345
>> [Peer]
>> PublicKey = aMC3f6kw***UDQVwo=
>> EndPoint = [2a01:4f8:***:***::5]:40111
>> AllowedIPs = fc00::10/7

Here's where you go wrong. On the _client_ you want:
    AllowedIPs=::/0,0.0.0.0/0
In other words, the client trusts the server to send data as any IP,
and the client will send any IP data to the server.

The AllowedIPs you use on the server should most likely be a /128 and
a /32, however.
