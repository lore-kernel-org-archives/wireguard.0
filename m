Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e973d4f1
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:55:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 398db2cc
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:55:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ea542859
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:55:36 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id h129so32346946lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 10:55:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160708162337.GA5566@wolff.to>
References: <278721635a23c243@frisell.zx2c4.com>
 <20160708162337.GA5566@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 19:55:55 +0200
Message-ID: <CAHmME9r4WXY3_OM5O9jH5QONDaaGyKA08ypwQw+d=gBnn2BwuQ@mail.gmail.com>
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

Hi Bruno,

On Fri, Jul 8, 2016 at 6:23 PM, Bruno Wolff III <bruno@wolff.to> wrote:
>
> I tried this an noticed a problem. The keep alive packets don't set the
> reply IP address and port for the endpoint. (Which makes sense since they
> aren't authenticated.) So in the case of nat, where you won't know what the
> port is (and in some cases the IP address as well) you still can't connect
> to the end point behind the nat until there is some authenticated data sent
> from the end point.

UGH! You're right. Thanks for thinking about this properly, and good
observation.

>
> So if nat changes the port at some point, in order to reestablish a path,
> you need to send authenticated data. I am not thinking of an obvious way to
> tell when you just need to hold the port mapping via nat open versus when
> you need to send authenticated data to rebuild a connection after a port or
> IP address change from nat.

Well, after the initial authenticated data has been sent (say, at `ip
link set up` time), the persistent keepalives should keep the link
open, which would prevent NAT from changing the port. This _should_
work.

But is it too fragile? Maybe we should scrap all of this and make
persistent keepalives authenticated. I'm not too thrilled about that
though...
