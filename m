Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76f02873
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 11:34:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0f57b50
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 11:34:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fee367fe
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 11:25:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8020a367
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 11:25:35 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m83so469358oik.8
 for <wireguard@lists.zx2c4.com>; Sat, 20 Jan 2018 03:38:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAByA2P19rZDb4QFh__KnyhPhyfiMNOHJ13Rx4LV86V4LAS=EdA@mail.gmail.com>
References: <CAByA2P1s_SHXjyZvcDvCz7ehczf0bnNEe19F=-A4dUi5Q7BYJw@mail.gmail.com>
 <CAByA2P3iSs_1Hha=XZ7GShCh1QgxuOjvu2xZq3_VwQkiSkRQ_g@mail.gmail.com>
 <CAByA2P24P7wrLLkaKi5qQKFY+dkHX1wzy=npfwj8E-+WSuZPpg@mail.gmail.com>
 <CAByA2P0aAWtntN2dWTwa1i4HjAOTP5a_Xod93n9yTk9q_Yy9Zg@mail.gmail.com>
 <CAByA2P19rZDb4QFh__KnyhPhyfiMNOHJ13Rx4LV86V4LAS=EdA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 20 Jan 2018 12:38:08 +0100
Message-ID: <CAHmME9rMXtZaAfjuN0Y=0QTLB_qwu776-MK2G=GnEkoGjhGeeA@mail.gmail.com>
Subject: Re: Android app error on samsung s6
To: Alen Opacic <subixonfire@gmail.com>
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

Hi Alen,

Thanks for the report. That's very strange indeed. Do you have
/system/bin/ip? What's the output of `echo $PATH` in your terminal?

Jason
