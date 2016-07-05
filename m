Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb6cf4d0
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:11:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05a9ea4f
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:11:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e6b0786
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:11:26 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id f6so124843744lfg.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 17:14:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r8cNHAnuqMuP93YAhe77VUy=sX5NVS4kB+5U7tpF59Sg@mail.gmail.com>
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
 <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
 <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
 <20160705000658.GA6619@c3po>
 <CAHmME9r8cNHAnuqMuP93YAhe77VUy=sX5NVS4kB+5U7tpF59Sg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 02:14:45 +0200
Message-ID: <CAHmME9pP5mwhjsi5dGkd1XYu10vW3AZO+A8XRpCXqHf9_qOiSw@mail.gmail.com>
To: Michael Gerlach <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jens Viisauksena <viisauksena@posteo.de>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Oops:

# mv ../backup-config .

-->

# mv ../backup-config .config
