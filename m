Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e0d8efd
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 13:42:41 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 6363f3a7
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 13:42:41 +0000 (UTC)
Date: Sat, 8 Sep 2018 08:39:06 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Julian Orth <ju.orth@gmail.com>
Subject: Re: [PATCH 0/7] Allow changing the transit namespace
Message-ID: <20180908133906.GA20780@wolff.to>
References: <20180908121841.8372-1-ju.orth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <20180908121841.8372-1-ju.orth@gmail.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Sep 08, 2018 at 14:18:34 +0200,
  Julian Orth <ju.orth@gmail.com> wrote:
>
>wg set <device> transit-net <pid|file-path>
>
>The distinction is made based on the format of the argument. If it is an
>unsigned 32 bit integer, then it is interpreted as a process id.
>Otherwise it is interpreted as a file path. /proc does not need to be
>mounted to use the process id interpretation. To force the
>interpretation as a file-path, use a ./ prefix.

Ambiguity is generally not a good idea (especially for security applications). 
It's not my decision, but I'd rather see the syntax make it clear what the type 
of the parameter is supposed to be.
