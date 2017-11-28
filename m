Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 118ec5ae
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:30:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 835cf7fe
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:30:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b33ac96
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:30:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb6b123e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 12:30:18 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id a81so113828oii.13
 for <wireguard@lists.zx2c4.com>; Tue, 28 Nov 2017 04:36:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5A1D5741.21951.47BB55BB@pageexec.freemail.hu>
References: <20171111080920.GA5705@localhost.localdomain>
 <5A0ACF98.2734.3D2AE425@pageexec.freemail.hu>
 <CAHmME9oL=p3snOEWevyqHYSy3yjdpDrtyQYViT__9BxJYU=1cw@mail.gmail.com>
 <5A1D5741.21951.47BB55BB@pageexec.freemail.hu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Nov 2017 13:36:10 +0100
Message-ID: <CAHmME9oxY3JRX4W3Xsx-RTc-9NKEdoC_14nPz+7R2_X5b5sfJw@mail.gmail.com>
Subject: Re: imer_setup() is not compatible with PaX's RAP
To: pageexec@freemail.hu
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

On Tue, Nov 28, 2017 at 1:32 PM, PaX Team <pageexec@freemail.hu> wrote:
> targets of indirect calls must be marked by the RAP hash which the plugin
> will do for code it sees but for asm you'll have to do it yourself, look at
> the use of RAP_ENTRY to see how that works.

Oh, terrific. So I can just do something horrible like:

#ifdef RAP_PLUGIN
#undef ENTRY
#define ENTRY RAP_ENTRY
#endif
