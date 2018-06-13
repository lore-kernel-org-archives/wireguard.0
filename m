Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92ce1657
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 21:08:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c8da42f
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 21:08:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44524f41
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 21:07:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2231083f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 21:07:24 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id w13-v6so4619250ote.11
 for <wireguard@lists.zx2c4.com>; Wed, 13 Jun 2018 14:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
 <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
 <CAHmME9qU1OWW72PJ1q1=7pf+EYiPe8vdQX1V2f96Vi6WRmi9Ow@mail.gmail.com>
 <CAHmME9okF00z8-9xPU=dm_vOrdf5gv4D+CpWtVXdu2oW+N-7zw@mail.gmail.com>
 <98f37803e752f4d4f19b9064240f0b876b2db588.camel@mjr.org>
In-Reply-To: <98f37803e752f4d4f19b9064240f0b876b2db588.camel@mjr.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 23:12:21 +0200
Message-ID: <CAHmME9rqOp5F2BmSHPM01HtuPQSAGcA_hECZCSFN5UPckRGaaQ@mail.gmail.com>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
To: paul@mjr.org
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

On Wed, Jun 13, 2018 at 4:54 PM Paul Hedderly <paul@mjr.org> wrote:
> Yea that performance hit is a nuisance

I find that doubtful, for the reasons Greg mentioned.

But in either case, I don't anticipate this will be the final
situation, but rather just a stop gap measure. I think we'll be ready
to revisit this after working on some other related FPU changes. And
for the time being, this at least fixes the crashes.
