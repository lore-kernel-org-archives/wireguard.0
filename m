Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f8e5df5
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 18:57:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31af4789
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 18:57:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc2612fe
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 18:55:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e257a28
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Aug 2018 18:55:55 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id q11-v6so9935806oic.12
 for <wireguard@lists.zx2c4.com>; Thu, 16 Aug 2018 12:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAAWNVq8Cpsqyd66fObKNDYsK9sDE8b1YhEYaz-ZFTujvYeqOcw@mail.gmail.com>
 <1ddd5012b4e54c6381079ceab335576fcc530c60.1534172353.git.gang.zhao.42@gmail.com>
In-Reply-To: <1ddd5012b4e54c6381079ceab335576fcc530c60.1534172353.git.gang.zhao.42@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 Aug 2018 12:09:07 -0700
Message-ID: <CAHmME9oUA0JgspMdYNy96YyjeFQYA_cb59=4vd2t4C-eUrKOpQ@mail.gmail.com>
Subject: Re: [PATCH android] config: fix wrong Peer endpoint string format
To: gang.zhao.42@gmail.com
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

Hi Gang,

Thanks for the patch, I'll merge the first hunk of this but not the
second, because:

On Thu, Aug 16, 2018 at 11:58 AM Zhao Gang <gang.zhao.42@gmail.com> wrote:
> -        return String.format("%s:%d", endpoint.getHostString(), endpoint.getPort());
> +
> +        if (endpoint.getHostString().contains(":") && !endpoint.getHostString().contains("["))
> +            return String.format("[%s]:%d", endpoint.getHostString(), endpoint.getPort());
> +        else
> +            return String.format("%s:%d", endpoint.getHostString(), endpoint.getPort());

This seems like a fix for the bug. But:

> -        if (endpoint.getAddress() instanceof Inet6Address)
> -            return String.format("[%s]:%d",
> -                    endpoint.getAddress().getHostAddress(),
> -                    endpoint.getPort());
> -        return String.format("%s:%d",
> -                endpoint.getAddress().getHostAddress(),
> -                endpoint.getPort());

The purpose of the code here is to resolve the hostname to an IP
address, and then return ip+port, with no hostnames in it. Replacing
it with a call to the prior fixed function isn't the intended
behavior.

I've committed your fix here as:
https://git.zx2c4.com/wireguard-android/commit/?id=ace2a77bc9019d050112bed5a5d1eb2a3363d971

Thanks again,
Jason
