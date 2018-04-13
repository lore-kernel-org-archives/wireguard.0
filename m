Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1165b07
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:17:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8df2e48
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:17:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccb6918a
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:08:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ede2fb98
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:08:11 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id o9-v6so11544694otj.5
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 15:31:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522084637.2044.53.camel@gmail.com>
References: <1522084637.2044.53.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 00:31:13 +0200
Message-ID: <CAHmME9r6wEqkk1XfYfQBqHy6dg0KUivbf+owsr8JXh6DW2C0Gg@mail.gmail.com>
Subject: Re: ideas/features
To: ST <smntov@gmail.com>
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

Hi ST,

On Mon, Mar 26, 2018 at 7:17 PM, ST <smntov@gmail.com> wrote:
> 1. Labels.
>
> Is it possible to add an optional label to a peer to make it a bit more
> usable for humans (who tend not to remember IPs or keys). A label
> associated with a peer is just a string (could be a first/last name,
> email, "NY Office" or whatever). So if you read through the .conf file
> or query wg for that label - you can get the right IP to SSH to, if
> needed.
>
> In the .conf file it could probably be realized through some sort of
> comments before each [Peer] section (didn't check whether # or something
> actually work). But querying wg from command line for a label is also
> handy...

A lot of people have asked for this; there's some discussion on the
list. I'm not entirely opposed to it, but the use case does seem
extremely limited. Often times you want a label so that you can then
correlate it with another piece of information to find more info in a
database or in an API. But in that case, why not use the public key as
the piece of correlating information? On the other hand, it would make
things a bit nicer from an administrative perspective if you're using
the basic wg utility and want a bit more information in there.

I've implemented this feature in a branch, but keep hesitating each
time I think about merging it. I should revisit it and come up with
something definitive one way or another.

>
>
> 2. Includes in .conf files.
>
> Is it possible to include .conf files in the main wg0.conf file? Like:
>
> [Interface]
> ...
>
> Include ./us_peers.conf
> Include ./eu_peers.conf

Seems useful, though a bit awkward to have in the .ini syntax. Many
systems, instead of include directives, choose to either go with an
external preprocessor (m4, cpp, bash, etc) for this kind of thing, or
go with the conf.d approach:
/etc/wireguard/someserver.conf.d/{001-something,002-anotherpart,003-alsothis}.
The conf.d approach has the advantage of being very easy to understand
and deal with, and one can see clearly how it would work with
wireguard -- `wg setconf wg0 <(cat
/etc/wireguard/someserver.conf.d/*)`. Would that handle your use case?

Jason
