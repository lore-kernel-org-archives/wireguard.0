Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e2932c2
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:07:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c1b42a8
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:07:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52eaf19a
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:05:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f8c06e89
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:05:57 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id c190-v6so18848706oig.6
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 22:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <CACN7iODgJZhvcjwc-Edd0z=4DxOwzL34+UbbXP_Xc87n=4ZdcQ@mail.gmail.com>
In-Reply-To: <CACN7iODgJZhvcjwc-Edd0z=4DxOwzL34+UbbXP_Xc87n=4ZdcQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Aug 2018 23:20:12 -0600
Message-ID: <CAHmME9q-Ta3QhakfqeAt=y6bUtE_n4ErHgMFN_KOU59ns5dpeg@mail.gmail.com>
Subject: Re: wireguard-android build error
To: dcow@eero.com
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

Yes, right now I make use of insane flags of GNU coreutil's ls(1). I
can probably replace these with something BSD compatible instead, like
I did for the iOS bridge code, which does something similar.
