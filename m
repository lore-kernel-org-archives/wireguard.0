Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a37c2233
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:46:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 065ce006
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:46:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83a87360
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:46:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id deda5530
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 19:46:49 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id a81so9363971oii.13
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 11:51:50 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171121194137.GA20179@wolff.to>
References: <20171121194137.GA20179@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 20:51:49 +0100
Message-ID: <CAHmME9pQvuB8g601HFJgCf0mpvHN+eqoj_2OngmMitKr_eZAgw@mail.gmail.com>
Subject: Re: d8738d57ab9ab976a1899e73d955d38317f44486 not building with
 4.15.0-0.rc0.git6.
To: Bruno Wolff III <bruno@wolff.to>
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

Hi Bruno,

I'll start working on 4.15 after rc1 hits or possibly sooner, as
there's currently quite a bit of churn at the moment. The current
errors are caused by:

https://git.zx2c4.com/linux/commit/?id=0a833c29d89656025443cb9f0ebff7052dd95ce0
https://git.zx2c4.com/linux/commit/?id=d15155824c5014803d91b829736d249c500bdda6

Jason
