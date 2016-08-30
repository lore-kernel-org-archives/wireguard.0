Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id ed19f4f6
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2016 15:53:17 +0000 (UTC)
Date: Tue, 30 Aug 2016 10:44:39 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
Message-ID: <20160830154439.GA5923@wolff.to>
References: <20160830064454.GA12680@matrix-dream.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
In-Reply-To: <20160830064454.GA12680@matrix-dream.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] wg set - unexpected change of routes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Aug 30, 2016 at 07:44:54 +0100,
  Ivan Labáth <labawi-wg@matrix-dream.net> wrote:
>
>I think repeating subnets in different peers is most probably
>an error and in such circumstances the most useful action would
>be to fail and report it as such.

Except in some cases it is convenient to use a large network for one peer 
and carve out a small subnet in another. Having to list a big subnet with 
a carve out as the sum of smaller networks can be a big pain.
