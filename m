Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bab4e46
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:17:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73af2d56
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:17:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9ea826e
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:17:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ec2af141
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Oct 2017 22:17:39 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id a132so781317oih.11
 for <wireguard@lists.zx2c4.com>; Tue, 31 Oct 2017 15:20:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
References: <CA+Hw3eY4541LNE9TnS5tsU2O+n28BNQ-Spko5dpem8Ej2_ctFA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 31 Oct 2017 23:20:02 +0100
Message-ID: <CAHmME9qZsKXR--RVJbyA-DPGKeX4GuYEwVp2EP6VhVE59hSOAQ@mail.gmail.com>
Subject: Re: Fix Debian install guide on wireguard.com/install
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Hey Daniel,

I have no idea what the right instructions to give for Debian are. Is
there something I should be doing so I don't have to hard code those
keys on the install page instructions?

Jason

On Tue, Oct 31, 2017 at 11:18 PM, Adri=C3=A1n Mih=C3=A1lko <adriankoooo@gma=
il.com> wrote:
> There is a missing step in the Debian installation guide, you must import
> GPG keys before you can add the new repo:
>
> gpg --keyserver pgpkeys.mit.edu --recv-key  8B48AD6246925553
> gpg -a --export 8B48AD6246925553 | sudo apt-key add -
>
> and also the key 7638D0442B90D010
>
> gpg --keyserver pgpkeys.mit.edu --recv-key 7638D0442B90D010
> gpg -a --export 7638D0442B90D010 | sudo apt-key add -
>
> More about PGP and APT:
>
> http://ccm.net/faq/809-debian-apt-get-no-pubkey-gpg-error
>
> Regards,
> Adrian Mihalko
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
