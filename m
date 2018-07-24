Return-Path: s.gottschall@dd-wrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf98f0b5
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Jul 2018 11:23:02 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f46d7b77
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Jul 2018 11:23:02 +0000 (UTC)
Subject: Re: Wireguard fails on recent updates for OpenWRT on Turris Omnia,
 but same versions work on other (Linksys) routers with same CPU
To: Steven Honson <steven@honson.id.au>, Aaron Jones
 <aaronmdjones@gmail.com>, mike@pmfarmwald.com, wireguard@lists.zx2c4.com
References: <131640bf823f0fba0adf5985e2e8aa17@mail.gmail.com>
 <CAHmME9r0rTCydGrf9cB474j1GOavzsdf8rDwLUhmMiK9FsTYbQ@mail.gmail.com>
 <3980181ad4f2980831b273db734f7772@mail.gmail.com>
 <ac459db2-43e2-975e-decd-86a5066dde0d@gmail.com>
 <8F6E9B31-B1E3-4304-8DE0-2F5F5CFB9779@honson.id.au>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <98a0ed6b-9cb1-8ce3-b0fe-71701381fd44@dd-wrt.com>
Date: Tue, 24 Jul 2018 13:32:10 +0200
MIME-Version: 1.0
In-Reply-To: <8F6E9B31-B1E3-4304-8DE0-2F5F5CFB9779@honson.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

openwrt doesnt use kernel 4.4 anymore for a long time. as far as i know 
it switched to 4.14 since some weeks
however the original omnis turria openwrt fork uses 4.4, but with 
different kernel configs. so you have to build wireguard
using exact the same sourcebase including kernel config, which is used 
in your omnis turria device


Am 24.07.2018 um 11:49 schrieb Steven Honson:
>> On 22 Jul 2018, at 11:02 pm, Aaron Jones <aaronmdjones@gmail.com> wrote:
>>
>> # cat /sys/module/wireguard/version
> On LEDE 17.01.5 at least, `/sys/module/wireguard/version` doesn’t exist, I’m not sure if this is the same for the release candidates of OpenWrt 18.06.
>
> Unfortunately `modinfo wireguard` doesn’t give any indication of the version either for me with LEDE 17.01.5:
>
> # modinfo wireguard
> module:		/lib/modules/4.4.140/wireguard.ko
> alias:		net-pf-16-proto-16-family-wireguard
> alias:		rtnl-link-wireguard
> license:	GPL v2
> depends:	udp_tunnel,ip6_udp_tunnel
>
> If you have installed WireGuard from the LEDE/OpenWrt package repository, then `opkg info wireguard-tools` to check the tools, and `opkg info kmod-wireguard` to check the kernel module is one way to verify the version:
>
> # opkg info wireguard-tools
> Package: wireguard-tools
> Version: 0.0.20180625-1
> Depends: libc, libmnl, ip
> Status: install ok installed
> Section: net
> ...
>
> # opkg info kmod-wireguard
> Package: kmod-wireguard
> Version: 4.4.140+0.0.20180519-1
> Depends: kernel (= 4.4.140-1-78acdb0e5133ba67c91f7694e305d1e7), kmod-udptunnel6, kmod-udptunnel4
> Status: install ok installed
> ...
>
> Note that updates to the tools appear to be backported regularly to LEDE 17.01, but the kernel module appears to be as of the version available at the time of the release (17.01.5 in my case), so it isn’t unusual for these versions to not match as is the case here with mine. I’m not sure if the next release of OpenWrt will do a similar thing. It’d be nice if the kernel module updates were backported too.
>
> Cheers,
> Steven
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
