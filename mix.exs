defmodule Meteorappapi.Mixfile do
  use Mix.Project

  def project do
    [app: :meteorappapi,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Meteorappapi, []},
     applications: [
       :phoenix, :phoenix_pubsub, :phoenix_html,
       :phoenix_ecto, :mongodb,
       :cowboy, :logger, :gettext,
       :poolboy, :uuid,
       # :httpoison,
       :absinthe_plug,
    ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.4"},
     {:phoenix_pubsub, "~> 1.0"},
     # the mongodb_ecto & phoenix_ecto, both need to require same {:ecto, "~> 2.1"}
     {:phoenix_ecto, "~> 3.2"},
     {:mongodb_ecto, github: "zeroasterisk/mongodb_ecto", branch: "ecto-2.1"},
     #{:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.6"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.11"},
     {:cowboy, "~> 1.0"},
     {:timex, "~> 3.0"},
     {:uuid, "~> 1.1" },
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:absinthe, "~> 1.3"},
     # {:absinthe, github: "absinthe-graphql/absinthe", branch: "master"},
     {:absinthe_plug, github: "absinthe-graphql/absinthe_plug", branch: "master"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
     "test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
