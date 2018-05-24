Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56a63355
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:09:17 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd746434
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:09:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 645431ed
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:08:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f49f4c47
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 15:08:03 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id t1-v6so2322219ott.13
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 08:10:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rPPrf3TzWT4EMkm5ixKUpB86Ms3ruVbgQsGhOY8+OdHg@mail.gmail.com>
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
 <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
 <CAHmME9pMHQ0hjbZ35sf7d1NQkuOJxwHRhEwJ5PdOP98epmmWWQ@mail.gmail.com>
 <CAHmME9rPPrf3TzWT4EMkm5ixKUpB86Ms3ruVbgQsGhOY8+OdHg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 24 May 2018 17:10:37 +0200
Message-ID: <CAHmME9pHPSpAYBfHYzF0mFvKhnw0GudcwdJg=SHbVDLk9BG6KA@mail.gmail.com>
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
To: nnet <nnet@fastmail.fm>
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

On Thu, May 24, 2018 at 5:04 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> It would appear that T-Mobile is using 464XLAT and Android runs
> https://github.com/toreanderson/clatd

Rather, this: https://android.googlesource.com/platform/external/android-clat/
