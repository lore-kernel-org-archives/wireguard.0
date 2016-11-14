Return-Path: john@mib-infotech.co.nz
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c5371c2
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 03:07:40 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id f188so48220990pgc.3
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 19:10:12 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
 <CAHmME9o8zt+5uq=yuw1jsZZhMRcwLasPjpk=O5tpjcp_+55HNQ@mail.gmail.com>
 <215ed362-725f-a236-d236-bc31bf508005@mib-infotech.co.nz>
 <CAHmME9pjf8Ue0fbunCX5WJrjp51ow8+9OoeUza-40_ACHLcqPw@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <a69a0138-f888-e9ec-e6b6-91800d9e70bc@mib-infotech.co.nz>
Date: Mon, 14 Nov 2016 16:10:06 +1300
MIME-Version: 1.0
In-Reply-To: <CAHmME9pjf8Ue0fbunCX5WJrjp51ow8+9OoeUza-40_ACHLcqPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Debugging AllowedIps
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Aha,

Yes the  dmesg command has  the debug output.


and the solution was to put the explicit /32 for the client on the host 
not the /24

and 0.0.0.0/0  on the client.

Thanks,

John




On 14/11/16 15:59, Jason A. Donenfeld wrote:
> On Mon, Nov 14, 2016 at 3:28 AM, John Huttley <john@mib-infotech.co.nz> wrote:
>> I'm using gentoo x64. debug USE is enabled
> After recompiling with USE=debug, you'll need to remove and then
> insert the module:
>
> # rmmod wireguard
> # modprobe wireguard
>
> If that doesn't do it, then it means you have dynamic debugging
> enabled in your kernel, in which case you'll have to turn on debug
> messages via:
>
> # echo "module wireguard +p" >/sys/kernel/debug/dynamic_debug/control
>
>> Nothing but the module startup in /var/log/dmesg
> A better more up to date source is generally the output of the `dmesg` command.
>
>> I start the server like this
> I assume you're going for a classic client/server topology, in which
> the server routes internet traffic. Usually in this case you want
> something like:
>
> -- Server --
> # ip addr add 192.168.1.254/24 dev wg0
> wg0.conf:
> [Peer]
> PublicKey = ABCD
> AllowedIPs = 192.168.1.20/32
> [Peer]
> PublicKey = DCBA
> AllowedIPs = 192.168.1.21/32
> [Peer]
> PublicKey = ABAB
> AllowedIPs = 192.168.1.22/32
>
> -- Client --
> # ip addr add 192.168.1.20/24 dev wg0
> wg0.conf:
> [Peer]
> PublicKey = EEEG
> AllowedIPs = 0.0.0.0/0
