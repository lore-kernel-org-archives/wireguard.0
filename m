Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9cdaf4c
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 01:18:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30e1938c
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 01:18:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9a4fc43
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 01:31:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8e9dd811
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jun 2017 01:31:56 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id i31so7220665ota.3
 for <wireguard@lists.zx2c4.com>; Mon, 05 Jun 2017 18:32:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANUDHxUV=qHinZWs54BqzRRtAXhA1o7iSBb4J9yB7FhWAQc25Q@mail.gmail.com>
References: <CANUDHxUV=qHinZWs54BqzRRtAXhA1o7iSBb4J9yB7FhWAQc25Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Jun 2017 03:32:09 +0200
Message-ID: <CAHmME9qFXRYGFnik5n83YoCixDuu7cLoBy=TfnADyp2H+Ynn-w@mail.gmail.com>
Subject: Re: Kernel Panic (20170531, 4.9.16-gentoo)
To: Hubert Goisern <zweizweizwoelf@gmail.com>
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

Hey Hubert,

Thanks for reporting. Could you tell me what snapshot version this is
(`cat /sys/module/wireguard/version`)? And would you send me your
wireguard.ko file, located probably in
/lib/modules/4.9.16-gentoo/net/wireguard.ko ?

Thanks,
Jason
