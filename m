Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2e22c09
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 07:53:39 +0000 (UTC)
Received: from mail.higgsboson.tk (mail.higgsboson.tk [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b9a790c
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Dec 2016 07:53:39 +0000 (UTC)
Subject: Re: openwrt route_allowed_ips is inprecise
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, =?UTF-8?Q?Dan_L=c3=bcdtke?=
 <mail@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <232dbabb-d3f0-6f84-bd21-a6c6abab2441@higgsboson.tk>
Date: Mon, 19 Dec 2016 09:00:29 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2016-12-18 21:14, Jason A. Donenfeld wrote:
> Hey Dan,
>
> The route_allowed_ips directive is not precise enough. I'm CCing Jorg,
> the NixOS maintainer, because this same concern probably applies to
> the Nix logic.
>
> Your code is:
>
>   if [ ${route_allowed_ips} -ne 0 ]; then
>    for allowed_ip in ${allowed_ips}; do
>      case "${allowed_ip}" in
>        *:*/*)
>          proto_add_ipv6_route "${allowed_ip%%/*}" "${allowed_ip##*/}"
>        ;;
>        */*)
>          proto_add_ipv4_route "${allowed_ip%%/*}" "${allowed_ip##*/}"
>        ;;
>      esac
>    done
>  fi
>
> The way it should be done is described in wg-config:
>
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/wg-config/wg-conf=
ig#n130
>
>     if [[ $AUTO_ROUTE -eq 1 ]]; then
>         for i in $(wg show "$INTERFACE" allowed-ips | cut -f 2 | tr -d =
,); do
>             if ! add_default "$i" && [[ $(ip route get "$i") !=3D *dev\=

> $INTERFACE\ * ]]; then
>                 add_route "$i"
>             fi
>         done
>     fi
>
> The add_default thing just accounts for dealing with 0/1 128/1, which
> you can ignore, since openwrt has the dependency mechanism. But the
> important thing is that I run `ip route get` for each one, and only
> add a route if necessary.

Should no the output first sorted from the shortest subnet prefix to the =
longest?
What do you mean be precise? Is there a bug in the other logic apart from=

probably unnecessary routes?
