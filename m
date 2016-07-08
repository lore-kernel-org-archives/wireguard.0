Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e974102
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 21:44:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 099c389b
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 21:44:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 69abe3e2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 21:44:46 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id q132so35687126lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 14:45:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160708205451.GA5959@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
 <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
 <CAHmME9o0RrpbUBB7nBQ319d_0pragpf94jFX0ZCGdMX9W8T1ug@mail.gmail.com>
 <20160708195507.GA1990@wolff.to>
 <CAHmME9ogt0izYi9_+3DqdEZAofLRE98fXdo1u7B581B0MknYUw@mail.gmail.com>
 <20160708205451.GA5959@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 23:45:06 +0200
Message-ID: <CAHmME9q-Q1wHJjU=sYKref7xXp=kcp0GOo2KJ7n1ozV9dauTCA@mail.gmail.com>
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

Hey Bruno,

On Fri, Jul 8, 2016 at 10:54 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> Yep, that was it. It allowed a remote connection at start up without having
> to manually send traffic out locally first. So it looks like it is working
> as expected.
>
> Right now I am testing through a stateful firewall that blocks the inbound
> connection unless it is related to an already established connection. That
> isn't exactly the same as nat, but should work similarly for testing
> purposes.

Excellent to hear! Hopefully it continues to work well. If so, I'll
merge next week and roll a new snapshot.

Regards,
Jason
