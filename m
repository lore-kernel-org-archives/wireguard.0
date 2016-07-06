Return-Path: Jason@zx2c4.com
MIME-Version: 1.0
In-Reply-To: <20160706120410.GA765@wolff.to>
References: <20160706120410.GA765@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 16:33:02 +0200
Message-ID: <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Bruno,

Thanks for your feedback on this. That's a good idea to call ip-link
del first. I get that the - will make the error non-fatal, but will it
also suppress writing the error message into journald?

Please feel free to make wgserver.service into a more robust unit file
and send patches (git-send-email), or make a few different unit files
show casing different types of configurations. I'm not a huge systemd
guy, so I just sort of threw that together haphazardly. It'd be nice
also to see this integrated into systemd-networkd and the .network
units. Are you involved with upstream at all? Interested in taking
this integration work on?

Jason

On Wed, Jul 6, 2016 at 2:04 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> While wgserver.service is going to need some customization for each
> instance, there are a couple of things you might want to change in the
> example.
>
> If for whatever reason wgserver is left setup, starting and restarting the
> service will fail until the device is manually removed.
> Adding the following as the first ExecStart will help:
> ExecStart=-/bin/ip link del dev wgserver
> That will attempt to clean up any left over device as part of the startup
> process. Which will keep:
> ExecStartPre=/usr/sbin/ip link add dev wg0 type wireguard
> from failing (exit status 2 if the device already exists) and aborting the
> service startup.
>
> Also according to the systemd documentation, ExecStopPost commands are
> supposed to be run when starting fails. It doesn't seem to actually work
> this way on Fedora and I have filed a bug about it. But it may still be
> better to change:
> ExecStop=/bin/ip link del dev wgserver
> To:
> ExecStopPost=/bin/ip link del dev wgserver
>
> Another note, that I'm not sure there is a standard fix for, but might be
> worth throwing in something for, is that if your config has a host name in
> it, you need functioning DNS when the service starts. And hence one may want
> to add Requires= and After= for a DNS service in some cases.
>
> The example was helpful to me in figuring out the service files I am
> actually using on my two endpoints.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard
