Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 372946f1
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 20:20:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 807568ef
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 20:20:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 98e3a0d4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 20:20:50 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id h129so34602907lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 13:21:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160708195507.GA1990@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
 <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
 <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
 <20160708195507.GA1990@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 22:21:09 +0200
Message-ID: <CAHmME9ogt0izYi9_+3DqdEZAofLRE98fXdo1u7B581B0MknYUw@mail.gmail.com>
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

On Fri, Jul 8, 2016 at 9:55 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> It looks like initially it does 0 length udp packets for keep alive and the
> authenticated keep alives don't seem to happen until after some data is
> sent.

I suspect you forgot to rmmod the previous module before trying this
branch. There are no 0 length udp packets sent anywhere in this
branch's code paths.
