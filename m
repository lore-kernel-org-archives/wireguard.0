Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05aaa77e
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 18:48:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35ddf402
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 18:48:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id afb090b3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 18:48:48 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id f6so33188706lfg.0
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 11:49:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
 <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 20:49:07 +0200
Message-ID: <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160708.1`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Jul 8, 2016 at 7:55 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> But is it too fragile? Maybe we should scrap all of this and make
> persistent keepalives authenticated. I'm not too thrilled about that
> though...

I'm experimenting with this in the authenticated-persistent-keepalive
branch, if you'd like to try it out and report back on how it goes...
